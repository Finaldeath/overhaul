//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_wolfpup
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Signals the death event for the wolves if
     a PC killed them. This will kill the wolf
     quest if they have it.

     Also, there is an event to have them run off
     if they are saved in the quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 23, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        int iState = GetLocalInt(GetModule(), "HX_WOLF_QUEST");

        if(GetTag(OBJECT_SELF) == "hx_winter_wolf_p")
        {
            if(iState == 3)
            {
                if(GetTag(GetArea(OBJECT_SELF)) == "TheWastelands")
                {
                    if(GetCurrentAction() != ACTION_MOVETOPOINT)
                    {
                        ClearAllActions();
                        ActionRandomWalk();
                    }
                }
                else
                {
                    location lLoc = GetLocation(GetObjectByTag("hx_wolfpup_jump_wp"));
                    object oEnd = GetObjectByTag("hx_wolfpup_run_wp");

                    if(GetDistanceToObject(oEnd) < 5.0)
                    {
                        ClearAllActions(TRUE);
                        ActionJumpToLocation(lLoc);
                    }
                    else if(GetCurrentAction() != ACTION_MOVETOPOINT)
                    {
                        ClearAllActions(TRUE);
                        ActionMoveToLocation(GetLocation(oEnd), TRUE);
                    }
                }
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        string sTag = GetTag(OBJECT_SELF);
        int iState = GetLocalInt(GetModule(), "HX_WOLF_QUEST");
        object oKiller = GetLastKiller();

        // Wolf deaths only matter if quest is active.
        if(iState == 1)
        {
            // Quest over. All hostile.
            SetLocalInt(GetModule(), "HX_WOLF_QUEST", 5);
            AdjustReputation(oKiller, OBJECT_SELF, -100);

            if(sTag == "hx_winter_wolf_a")
            {
                // Set journal to alpha killed.
                AddJournalQuestEntry("XP2_Wolves", 50, GetPCSpeaker(), TRUE, TRUE);
            }
            else if(sTag == "hx_winter_wolf_p")
            {
                // Set journal to pups killed.
                AddJournalQuestEntry("XP2_Wolves", 40, GetPCSpeaker(), TRUE, TRUE);
            }
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 4444)
    {
        //SetPlotFlag(OBJECT_SELF, TRUE);
        AdjustReputation(GetFirstPC(), OBJECT_SELF, 100);
    }
    else if(nUser == 5555)
    {
        return;
    }
}
