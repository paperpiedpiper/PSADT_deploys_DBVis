$LoggedOnUser = ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name).split('\')[-1]
$preferencesPath = "$env:SystemDrive\Users\$LoggedOnUser\.dbvis\config70"

# Load XML file if it exists, otherwise create a new XML structure
if (Test-Path "$preferencesPath\dbvis.xml") {
	[xml]$currXml = Get-Content "$preferencesPath\dbvis.xml"

	function UpdateOrCreateXmlElement($parent, $elementName, $value) {
		if (-not $parent.$elementName) {
			$newElement = $currXml.CreateElement($elementName)
			$newElement.InnerText = $value
			$parent.AppendChild($newElement)
		} else {
			$parent.$elementName = $value
		}
	}

	$general = $currXml.SelectSingleNode("//DbVisualizer/General")

	UpdateOrCreateXmlElement $general "CheckForUpdateInterval" "never"
	UpdateOrCreateXmlElement $general "LookAndFeel" "com.sun.java.swing.plaf.windows.WindowsLookAndFeel"
	UpdateOrCreateXmlElement $general "LookAndFeelAskAtStartup" "false"
	UpdateOrCreateXmlElement $general "VersionEULA" "2019-05-03"
	UpdateOrCreateXmlElement $general "VersionFeature" "10.0"

	$currXml.Save("$preferencesPath\dbvis.xml")
} else {
	# Create a new XML structure if the file doesn't exist
[xml]$newXml = @"
<?xml version="1.0" encoding="UTF-8"?>
<DbVisualizer>
	<General>
		<CheckForUpdateInterval>never</CheckForUpdateInterval>
		<LookAndFeel>com.sun.java.swing.plaf.windows.WindowsLookAndFeel</LookAndFeel>
		<LookAndFeelAskAtStartup>false</LookAndFeelAskAtStartup>
		<VersionEULA>2019-05-03</VersionEULA>
		<VersionFeature>10.0</VersionFeature>
	</General>
</DbVisualizer>
"@

	if (-not (Test-Path $preferencesPath)) {
		New-Item -Path $preferencesPath -ItemType Directory -Force
	}

	$newXml.Save("$preferencesPath\dbvis.xml")
}