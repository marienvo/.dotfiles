# WORK IN PROGRESS
# - fetch (fetches fresh calendars)
# - calcurse -stoday/stomorrow (shows today/tomorrow)
#
# todo:
# - remove URLs from public repo
# - add script that returns true/false when in a meeting (for use in shell clock)
#   - should also return true-ish 15 minutes before start of meeting

mkdir _tmp && cd _tmp || cd _tmp

# Download calendars
wget https://outlook.office365.com/owa/calendar/8a28a5fc68ef4c72b17dd73615595a19@eneco.com/8c43e785e09a4db2acf08c702a07229f10973903373350759217/calendar.ics
wget https://outlook.office365.com/owa/calendar/f8e86bb7b9fe41c38c6469737ff729cb@weareyou.com/039bac4b1f7f49b38595504c720b4bd78740543348176620377/calendar.ics

# Remove current data
rm -rf ~/.calcurse

# Import calendars
calcurse -i calendar.ics
calcurse -i calendar.ics.1

# Clean up downloads
cd ..
rm -rf ./_tmp

