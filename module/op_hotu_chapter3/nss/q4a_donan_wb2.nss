//::///////////////////////////////////////////////
//:: FileName  q4a_donan_wb2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script causes Donan to walk back to his
    starting point after conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////
void main() {
   // Walk back to spot.
    ActionMoveToLocation(GetLocation(GetWaypointByTag("q4a_donan_wp1")));
}
