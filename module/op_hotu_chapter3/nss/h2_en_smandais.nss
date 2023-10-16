//::///////////////////////////////////////////////
//:: Sleeping Man's Dais Trigger (OnEnter)
//:: H2_En_SManDais.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launches the Sleeping Man's pre-waking conv.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    //Only pay attention to PC enterers.
    object oPC = GetEnteringObject();

    // Brad Prince. Conv check.

    if (GetIsPC(oPC) == TRUE && !IsInConversation(oPC))
    {
        // Brad Prince
        // Added so that invis object won't speak if SMan is awake or gone.

        if(GetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT") != TRUE)
        {
            //Ensure that the Sleeping Man is still asleep and that the Invisible
            //Placeable is not already engaged in a conversation.
            object oInvis = GetObjectByTag("H2_SleepingInvis");
            int bConv = IsInConversation(oInvis);
            object oMan = GetObjectByTag("H2_SleepingMan");
            int bAwake = GetLocalInt(oMan, "bAwake");
            if (bConv == FALSE &&
                bAwake == FALSE)
            {
                //Clear the player's actions
                AssignCommand(oPC, ClearAllActions());

                //Launch the Invisible Placeable's Conversation.
                AssignCommand(oInvis, ActionStartConversation(oPC));
            }
        }
    }
}
