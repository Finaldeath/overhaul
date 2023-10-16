//::///////////////////////////////////////////////
//:: Name: q1rumcave_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On heartbeat in Rumgut's cave - if Rumgut is
    sleeping - the PC must sneak around in detect
    mode or the giant will waken.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "nw_i0_generic"
void WakeGiant(object oGiant, object oPlayer);
int GetIsInTrigger(object oTrigger, object oCreature);
void main()
{
    //if the PC has entered after Rebecca has put the giant to sleep
    if (GetLocalInt(GetModule(), "X1_Q1RuralRebCooking") == 2 && GetLocalInt(GetModule(), "X1_nRumgutSleep") == 1)
    {
        object oGiant = GetObjectByTag("q1foot_rumgut");
        object oEntry = GetObjectByTag("q1rumcave_stealthtrig");
        object oEntry2 = GetObjectByTag("q1rumcave_stealthtrig2");

        //object oPC = GetFirstObjectInArea(OBJECT_SELF);
        int nCount = 1;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oEntry, nCount);
        while (oPC != OBJECT_INVALID)
        {
            //make sure it is a pc
            //if (GetIsPlayerCharacter(oPC) == TRUE)
            //{
                //if the PC has moved away from the entrance
                if (GetIsInTrigger(oEntry, oPC) == FALSE && GetIsInTrigger(oEntry2, oPC) == FALSE)
                {
                    //check if the pc is in stealth mode
                    if (GetStealthMode(oPC) != STEALTH_MODE_ACTIVATED)
                    {
                        if (IsInConversation(oPC) == FALSE)
                        {
                            //Do stealth check - if failed - wake giant
                            if (GetIsSkillSuccessful(oPC, SKILL_MOVE_SILENTLY, 20) == FALSE)
                            {
                                WakeGiant(oGiant, oPC);
                                SetLocalInt(GetModule(), "X1_nRumgutSleep", 2);
                                DelayCommand(2.5, AssignCommand(oGiant, ActionStartConversation(oPC)));
                            }
                        }
                    }
                    //if in stealth mode - much easier check
                    else
                    {
                        //do stealth check - DC 10
                        if (GetIsSkillSuccessful(oPC, SKILL_MOVE_SILENTLY, 10) == FALSE)
                        {
                            WakeGiant(oGiant, oPC);
                            SetLocalInt(GetModule(), "X1_nRumgutSleep", 2);
                            DelayCommand(2.5, AssignCommand(oGiant, ActionStartConversation(oPC)));
                        }
                    }

                }
            //}
            //oPC = GetNextObjectInArea(OBJECT_SELF);
            nCount = nCount + 1;
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oEntry, nCount);
        }
    }

}
void WakeGiant(object oGiant, object oPlayer)
{

    effect eEff1 = GetFirstEffect(oGiant);
    while(GetIsEffectValid(eEff1))
    {
        RemoveEffect(oGiant, eEff1);
        eEff1 = GetNextEffect(oGiant);
    }
    object oRebecca = GetObjectByTag("q1ruralrebecca");
    if (GetTag(GetArea(oRebecca)) == "q1krumgut")
    {
        DelayCommand(0.5, AssignCommand(oGiant, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 0.1)));
        DelayCommand(1.0, AssignCommand(oGiant, SpeakStringByStrRef(40306)));
    }
    else
    {
        ChangeToStandardFaction(oGiant, STANDARD_FACTION_HOSTILE);
        DelayCommand(1.0, AssignCommand(oGiant, SpeakStringByStrRef(40307)));
        AssignCommand(oGiant, DetermineCombatRound(oPlayer));
    }
    SetLocalInt(GetModule(), "X1_nRumgutSleep",2);
    SetLocalInt(oGiant, "X1_RumgutDrunk", 2);
}
int GetIsInTrigger(object oTrigger, object oCreature)
{
    object oTest = GetFirstInPersistentObject(oTrigger);
    while (oTest != OBJECT_INVALID)
    {
        if (GetName(oCreature) == GetName(oTest))
            return TRUE;
        oTest = GetNextInPersistentObject(oTrigger);
    }
    return FALSE;
}
