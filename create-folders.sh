#!/bin/bash

# Function to create directory and move into it
mkcd() {
    mkdir -p "$1"
    cd "$1" || exit
}

# Function to create an .md file with title
create_md() {
    echo "# $1" > "$1.md"
}

# Navigate to docs folder in the project root
cd docs || { echo "Directory docs does not exist."; exit 1; }

# Define array of folders with their respective Markdown files
folders=(
    "01 Introduction|overview|objectives|definitions"
    "02 Project Philosophy|spiritual direction|motivations|the why|vision|mission|christian traditions|franciscan values|benedictine values|desert fathers and mothers"
    "03 Technology and Humanity|distraction economy|tech versus nature|tech mindfulness|tech in community"
    "04 Brainstorming Sessions|meeting minutes|attendee list|concepts generated|feedback loop"
    "05 Business Model Exploration|non-profit models|profit-based models|blended models|SWOT analysis"
    "06 Property|location research|property requirements|budgeting|land zoning laws|environmental assessments"
    "07 Labor|skillset inventory|community outreach|compensation models|WOOFing"
    "08 Funding|sources|funding requirements|financial projections"
    "09 Operations|agriculture plans|agri tourism|CSA farming|educational programs|technology requirements"
    "10 Marketing and Outreach|branding|community building|social media strategy|local partnerships"
    "11 Regulatory Compliance|licenses|permits|health safety guidelines|ethical considerations"
    "12 Case Studies and External Resources|relevant business models|academic papers|blogs|vlogs|books|workshops|seminars"
    "13 Spirituality and Contemplation|contemplative practices|spiritual reading|liturgy of hours"
    "14 Appendix|budget templates|timeline templates|checklists|forms applications"
    "15 Glossary|glossary"
    "16 Index|index"
)

# Loop over each folder and create subdirectories and Markdown files
for folder in "${folders[@]}"; do
    IFS='|' read -r parent_folder files <<< "$folder"
    mkcd "$parent_folder"
    IFS='|' read -r -a array <<< "$files"
    for i in "${array[@]}"; do
        create_md "$i"
    done
    cd ..
done
