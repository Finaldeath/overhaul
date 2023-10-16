//::///////////////////////////////////////////////
//:: Name q1foot_ent_rumcv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have Rumgut talk to any PCs entering his cave
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    object oRumgut = GetObjectByTag("q1foot_rumgut");
    object oRebecca = GetObjectByTag("q1ruralrebecca");
    if (GetTag(GetArea(oRebecca)) == "q1krumgut")
    {
        //if rebecca is going to try cooking Rumgut to sleep
        if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(GetModule(), "X1_Q1RuralRebCooking") == 1 && GetLocalInt(GetModule(), "X1_nRumgutSleep") == 0)
        {
            BlackScreen(oPC);
            DelayCommand(2.0, FadeFromBlack(oPC));
            SetLocalInt(GetModule(), "X1_nRumgutSleep",1);

            DelayCommand(2.0, AssignCommand(oRebecca, SpeakStringByStrRef(40355)));

            SetLocalInt(GetModule(), "X1_Q1RuralRebCooking", 2);
            AssignCommand(oRumgut, JumpToObject(GetWaypointByTag("wp_rumcave_rumsleep")));
            DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(), oRumgut, 600.0));
            //SetLocalInt(oRumgut, "X1_RumgutDrunk", 1);
        }
        else if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(GetModule(), "X1_Q1RuralRebPoison") == 1 && GetLocalInt(GetModule(), "X1_nRumgutSleep") == 0)
        {
            BlackScreen(oPC);
            DelayCommand(2.0, FadeFromBlack(oPC));
            SetLocalInt(GetModule(), "X1_RUMGUTDEAD",1);

            AssignCommand(oRebecca, ActionJumpToObject(GetWaypointByTag("wp_q1becka_free")));

            SetLocalInt(GetModule(), "X1_Q1RuralRebPoison", 2);
            AssignCommand(oRumgut, JumpToObject(GetWaypointByTag("wp_rumcave_rumsleep")));
            AssignCommand(oRumgut, SetIsDestroyable(FALSE, FALSE, TRUE));

            DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oRumgut));
            //SetLocalInt(oRumgut, "X1_RumgutDrunk", 1);
            AssignCommand(oRebecca, JumpToObject(GetWaypointByTag("wp_q1rbecka_postpoison")));
            DelayCommand(1.0, AssignCommand(oRebecca, ActionStartConversation(oPC)));
            //Destroy the cage door (for conversation purposes)..
            object oDoor1 = GetObjectByTag("q1rumgutcage1");
            object oDoor2 = GetObjectByTag("q1rumgutcage2");
            object oDoor3 = GetObjectByTag("q1rumgutcage3");

            SetPlotFlag(oDoor1, FALSE);
            SetPlotFlag(oDoor2, FALSE);
            SetPlotFlag(oDoor3, FALSE);
            DestroyObject(oDoor1, 0.5);
            DestroyObject(oDoor2, 0.5);
            DestroyObject(oDoor3, 0.5);

        }

        else if (GetIsPlayerCharacter(oPC) == TRUE && IsInConversation(oRumgut) == FALSE && GetLocalInt(oRumgut, "X1_RumgutDrunk") != 1 && GetStealthMode(oPC) == FALSE)
        {

            //AssignCommand(oRumgut, SpeakString("Oi - whatcha doing here.  Me wants private time with wifey!"));
            AssignCommand(oRumgut, ActionStartConversation(oPC));
            AssignCommand(oRebecca, SpeakStringByStrRef(40356));
        }
    }
    else
    {
         if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(GetModule(), "X1_Q1RuralRebFree") > 60 && GetObjectSeen(oPC, oRumgut) == TRUE)
            AssignCommand(oRumgut, ActionStartConversation(oPC));
    }
}
