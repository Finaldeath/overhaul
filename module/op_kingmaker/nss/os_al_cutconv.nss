//::///////////////////////////////////////////////
//:: os_al_cutconv
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts the dialog in cutscene mode for the Alias
    vote cutscenes :)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: April 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPCSpeaker;
    object oSelf = OBJECT_SELF;

    int iDLGClosing = GetLocalInt(OBJECT_SELF, "flg_cutclosing");
    int iDLGRunning = GetLocalInt(OBJECT_SELF, "flg_cutrunning");
    int iVoteCheck = GetLocalInt(OBJECT_SELF,"OS_ALIAS_VOTE");
    effect eAOE = EffectAreaOfEffect(AOE_MOB_HORRIFICAPPEARANCE, "aoe_hosfear", "aoe_hosfear");

    int iResult = FALSE;

    // Make Sure this only fires if Alias is pushing the vote
    if ((iVoteCheck == 20)||(iVoteCheck == 10))
    {
        // Apr 21 - Check to make sure the dialog isn't currently
        // closing or already in progress or the PC will be stuck
        // in eternal cutscene mode :(

        if ((iDLGClosing == FALSE) && (iDLGRunning == FALSE))
        {
            oPCSpeaker = GetPCSpeaker();

            SetCutsceneMode(oPCSpeaker, TRUE);

            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAOE, oSelf, 600.0f);

            AssignCommand(oPCSpeaker, ClearAllActions(TRUE));
            AssignCommand(oPCSpeaker,
                ActionForceMoveToObject(oSelf, FALSE, 1.0f, 2.0f));

            SetLocalInt(OBJECT_SELF, "flg_cutrunning", TRUE);
        }
    }

    return iResult;
}
