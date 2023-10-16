//::///////////////////////////////////////////////
//:: Name q1rumgut_cage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Open Rumgut's cage that is holding rebecca hurst
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 19/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oPC = GetLastUsedBy();
    object oItem = GetItemPossessedBy(oPC, "q1rumgutkey");
    if (oItem != OBJECT_INVALID)
    {
        object oDoor1 = GetObjectByTag("q1rumgutcage1");
        object oDoor2 = GetObjectByTag("q1rumgutcage2");
        object oDoor3 = GetObjectByTag("q1rumgutcage3");

        SetPlotFlag(oDoor1, FALSE);
        SetPlotFlag(oDoor2, FALSE);
        SetPlotFlag(oDoor3, FALSE);
        FloatingTextStrRefOnCreature(40346, oPC, FALSE);
        DestroyObject(oDoor1, 0.5);
        DestroyObject(oDoor2, 0.5);
        DestroyObject(oDoor3, 0.5);
        AssignCommand(oPC, PlaySound("as_dr_metlmedop1"));

        object oRebecca = GetObjectByTag("q1ruralrebecca");
        object oExit = GetWaypointByTag("wp_q1rbecka_running");

        AssignCommand(oRebecca, SpeakStringByStrRef(40347));
        AssignCommand(oRebecca, ActionForceMoveToObject(oExit, TRUE, 1.0, 10.0));
        //AssignCommand(oRebecca, ActionMoveToObject(oExit));
        DelayCommand(1.0, SetCommandable(FALSE, oRebecca));
        SetLocalInt(oRebecca, "nJumpOutsideCave", 1);
        //SetLocalInt(GetModule(), "X1_Q1RuralRebFree", 70);

        //DelayCommand(2.0, AssignCommand(oRebecca, ActionStartConversation(oPC)));
        //DelayCommand(3.5, SetCommandable(FALSE, oRebecca));
        //RewardXP("q1footrumgut", 100, GetPCSpeaker());
        object oRumgut = GetObjectByTag("q1foot_rumgut");
        if (GetLocalInt(oRumgut, "nRumgutGiveUp") == 0 && GetLocalInt(oRumgut, "X1_RumgutDrunk") != 1 && GetLocalInt(GetModule(), "X1_nRumgutSleep") != 1)
        {//if Rumgut hadn't given the key and he's not asleep or drunk - then he attacks
            SetIsTemporaryEnemy(oPC, oRumgut);
            AssignCommand(oRumgut, DetermineCombatRound(oPC));
        }
        DestroyObject(oItem);
    }
    else
    {

        SpeakOneLinerConversation();
    }
}
