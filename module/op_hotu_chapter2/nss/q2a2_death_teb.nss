//::///////////////////////////////////////////////
//:: Name q2a2_death_teb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nDieOnce", 1);

    //if Tebomir dies during the Zesyyr Betrayal Plot then run the
    //Zesyyr entering cutscene (once the Matron and Tebomir are both
    //dead.
    if (GetLocalInt(OBJECT_SELF, "X2_RunZesPlotCutscene") == 1)
    {
        //check to see if Tebomir is dead too
        object oMatron = GetObjectByTag("q2amaematron");
        if (GetIsObjectValid(oMatron) == FALSE || GetIsDead(oMatron) == TRUE)
        {
            //Run cutscene
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            object oMatGuard1 = GetObjectByTag("cut108_guard5");
            object oMatGuard2 = GetObjectByTag("cut108_guard6");
            //if either of the two guards are still alive - they run away
            if (GetIsObjectValid(oMatGuard1) == TRUE)
            {
                SetLocalInt(oMatGuard1, "nRetreat", 1);
                AssignCommand(oMatGuard1, ClearAllActions(TRUE));
                AssignCommand(oMatGuard1, PlayVoiceChat(VOICE_CHAT_FLEE));

                AssignCommand(oMatGuard1, ActionMoveAwayFromObject(oPC, TRUE));

                DestroyObject(oMatGuard1, 5.0);
            }
            if (GetIsObjectValid(oMatGuard2) == TRUE)
            {
                SetLocalInt(oMatGuard2, "nRetreat", 1);
                AssignCommand(oMatGuard2, ClearAllActions(TRUE));

                AssignCommand(oMatGuard2, ActionMoveAwayFromObject(oPC, TRUE));

                DestroyObject(oMatGuard2, 5.0);
            }

            ExecuteScript("cutscene116", oPC);
            return;
        }
    }
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
