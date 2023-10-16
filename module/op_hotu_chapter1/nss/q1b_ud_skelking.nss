//::///////////////////////////////////////////////
//:: Name q1b_ud_skelking
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have skeleton king sit in his assigned throne
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void AwakenKings(object oPC);
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

        //Everyone but the Intelligent Weapon Carrier is plot
        if (GetTag(OBJECT_SELF) != "q2bsk_2")
            SetPlotFlag(OBJECT_SELF, TRUE);
        object oChair = GetObjectByTag("q2bskthrone_" + GetStringRight(GetTag(OBJECT_SELF), 1));
        ActionSit(oChair);
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {
        //if the kings haven't gone hostile - have the dialog happen with the nearest
        //invisible dialog object.
        if (GetLocalInt(GetModule(), "X2_Q2BSkelKingsHostile") == 0)
        {

            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

            int szDialog1, szDialog2;
            int nRandom = Random(4) + 1;
            switch (nRandom)
            {
                case 1: szDialog1 = 84114;
                        szDialog2 = 84115;
                        break;
                case 2: szDialog1 = 84116;
                        szDialog2 = 84117;
                        break;
                case 3: szDialog1 = 84118;
                        szDialog2 = 84119;
                        break;
                case 4: szDialog1 = 84120;
                        szDialog2 = 84121;
                        break;
            }
            FloatingTextStrRefOnCreature(szDialog1, oPC);
            DelayCommand(3.0, FloatingTextStrRefOnCreature(szDialog2, oPC));
        }
    }
    else if(nUser == 1005) // ATTACKED
    {
        if (GetLocalInt(GetModule(), "X2_Q2BSkelKingsHostile") == 1)
            return;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        AwakenKings(oPC);
    }
    else if(nUser == 1006) // DAMAGED
    {
        if (GetLocalInt(GetModule(), "X2_Q2BSkelKingsHostile") == 1)
            return;
        object oPC = GetLastDamager();
        AwakenKings(oPC);
    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if (nUser == NW_FLAG_SPELL_CAST_AT_EVENT)
    {
        if (GetLocalInt(GetModule(), "X2_Q2BSkelKingsHostile") == 1)
            return;
        object oPC = GetLastSpellCaster();
        AwakenKings(oPC);
    }

}

void AwakenKings(object oPC)
{
    SetLocalInt(GetModule(), "X2_Q2BSkelKingsHostile", 1);
        object oKing1 = GetObjectByTag("q2bsk_1");
        object oKing2 = GetObjectByTag("q2bsk_2");
        object oKing3 = GetObjectByTag("q2bsk_3");
        object oKing5 = GetObjectByTag("q2bsk_5");
        object oKing6 = GetObjectByTag("q2bsk_6");
        object oKing7 = GetObjectByTag("q2bsk_7");
        object oKing9 = GetObjectByTag("q2bsk_9");

        if (oPC == OBJECT_INVALID)
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

        if (GetIsObjectValid(oKing1) == TRUE)
        {
            SetPlotFlag(oKing1, FALSE);
            ChangeToStandardFaction(oKing1, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing1, ActionMoveToObject(oPC));
            DelayCommand(6.0, AssignCommand(oKing1, DetermineCombatRound()));
        }
        if (GetIsObjectValid(oKing2) == TRUE)
        {
            SetPlotFlag(oKing2, FALSE);
            ChangeToStandardFaction(oKing2, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing2, ActionMoveToObject(oPC));
            DelayCommand(6.0, AssignCommand(oKing2, DetermineCombatRound()));
        }
        if (GetIsObjectValid(oKing3) == TRUE)
        {
            SetPlotFlag(oKing3, FALSE);
            ChangeToStandardFaction(oKing3, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing3, ActionMoveToObject(oPC));
            DelayCommand(6.0, AssignCommand(oKing3, DetermineCombatRound()));
        }
        if (GetIsObjectValid(oKing5) == TRUE)
        {
            SetPlotFlag(oKing5, FALSE);
            ChangeToStandardFaction(oKing5, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing5, ActionMoveToObject(oPC));
            DelayCommand(6.0, AssignCommand(oKing5, DetermineCombatRound()));
        }
        if (GetIsObjectValid(oKing6) == TRUE)
        {
            SetPlotFlag(oKing6, FALSE);
            ChangeToStandardFaction(oKing6, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing6, ActionMoveToObject(oPC));
            DelayCommand(6.0, AssignCommand(oKing6, DetermineCombatRound()));
        }
        if (GetIsObjectValid(oKing7) == TRUE)
        {
            SetPlotFlag(oKing7, FALSE);
            ChangeToStandardFaction(oKing7, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing7, ActionMoveToObject(oPC));
            DelayCommand(6.0, AssignCommand(oKing7, DetermineCombatRound()));
        }
        if (GetIsObjectValid(oKing9) == TRUE)
        {
            SetPlotFlag(oKing9, FALSE);
            ChangeToStandardFaction(oKing9, STANDARD_FACTION_HOSTILE);
            AssignCommand(oKing9, ActionMoveToObject(oPC));
            DelayCommand(6.0, AssignCommand(oKing9, DetermineCombatRound()));
        }

        //Close and lock the room doors
        object oDoor1 = GetObjectByTag("q2bskdoor1");
        object oDoor2 = GetObjectByTag("q2bskdoor2");
        AssignCommand(oDoor1, ActionCloseDoor(oDoor1));
        AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
        SetLocked(oDoor1, TRUE);
        SetLocked(oDoor2, TRUE);
        PlaySound("as_cv_brickscrp2");
}

