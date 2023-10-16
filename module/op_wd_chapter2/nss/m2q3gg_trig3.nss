//This will return the NPC to a starting position if he attempts to leave the
//trigger.  You must replace the value of sTag with the tag of the NPC in
//question. you must also have a waypoint with the tag "WP_Return_" + NPC's Tag.
//This should be placed in the spot the NPC starts at.
void main()
{
    string sTag = "m2q3G_MayorGG";
    object oExit = GetExitingObject();
    if(GetTag(oExit) == sTag)
    {
        AssignCommand(oExit,ClearAllActions());
        AssignCommand(oExit,ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + sTag)));
    }
}
