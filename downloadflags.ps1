$teams = @{
"Algeria"               = "dz"
"Argentina"             = "ar"
"Australia"             = "au"
"Austria"               = "at"
"Belgium"               = "be"
"Bosnia and Herzegovina"= "ba"
"Brazil"                = "br"
"Canada"                = "ca"
"Cape Verde"            = "cv"
"Colombia"              = "co"
"Croatia"               = "hr"
"Curacao"               = "cw"
"Czechia"               = "cz"
"DR Congo"              = "cd"
"Ecuador"               = "ec"
"Egypt"                 = "eg"
"England"               = "gb-eng"
"France"                = "fr"
"Germany"               = "de"
"Ghana"                 = "gh"
"Haiti"                 = "ht"
"Iran"                  = "ir"
"Iraq"                  = "iq"
"Ivory Coast"           = "ci"
"Japan"                 = "jp"
"Jordan"                = "jo"
"Mexico"                = "mx"
"Morocco"               = "ma"
"Netherlands"           = "nl"
"New Zealand"           = "nz"
"Norway"                = "no"
"Panama"                = "pa"
"Paraguay"              = "py"
"Portugal"              = "pt"
"Qatar"                 = "qa"
"Saudi Arabia"          = "sa"
"Scotland"              = "gb-sct"
"Senegal"               = "sn"
"South Africa"          = "za"
"South Korea"           = "kr"
"Spain"                 = "es"
"Sweden"                = "se"
"Switzerland"           = "ch"
"Tunisia"               = "tn"
"Turkey"                = "tr"
"United States"         = "us"
"Uruguay"               = "uy"
"Uzbekistan"            = "uz"
}

# Output folder
$folder = "$env:USERPROFILE\OneDrive - Odense Kommune\udvikling\projects\vm26\Flags"
New-Item -ItemType Directory -Path $folder -Force | Out-Null

foreach ($team in $teams.Keys) {
    $code = $teams[$team]
    $url = "https://flagcdn.com/w640/$code.png"
    $file = Join-Path $folder "$team.png"

    try {
        Invoke-WebRequest -Uri $url -OutFile $file -ErrorAction Stop
        Write-Host "✅ Downloaded $team"
    }
    catch {
        Write-Warning "❌ Failed: $team ($code)"
    }
}