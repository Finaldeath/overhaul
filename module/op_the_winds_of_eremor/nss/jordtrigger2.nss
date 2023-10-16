//This will return the NPC to a starting position if he attempts to leave the
//trigger.  You must replace the value of sTag with the tag of the NPC in
//question.
void main()
{
    string sTag = "CaptainJord";
    object oExit = GetExitingObject();
    if(GetTag(oExit) == sTag)
    {
        AssignCommand(oExit,ClearAllActions());
        AssignCommand(oExit,ActionMoveToObject(GetNearestObjectByTag("BelowDecks")));
        AssignCommand(oExit,ActionDoCommand(DestroyObject(oExit)));
    }
}

