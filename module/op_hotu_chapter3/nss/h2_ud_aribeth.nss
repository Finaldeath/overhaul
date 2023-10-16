//::///////////////////////////////////////////////
//:: Aribeth, User-Defined Events
//:: H2_UD_Aribeth.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Integrate Surrender behavior into the generic
     henchman behavior for Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////
#include "x0_i0_common"

void main()
{
    //Generic henchman behavior copied from x0_ch_hen_userdf.nss
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 20000 + ACTION_MODE_STEALTH)
    {
      int bStealth = GetActionMode(GetMaster(), ACTION_MODE_STEALTH);
      SetActionMode(OBJECT_SELF, ACTION_MODE_STEALTH, bStealth);
    }
    else if (nEvent == 20000 + ACTION_MODE_DETECT)
    {
      int bDetect = GetActionMode(GetMaster(), ACTION_MODE_DETECT);
      SetActionMode(OBJECT_SELF, ACTION_MODE_DETECT, bDetect);
    }
    //Surrender code copied from nw_c2_j_surrend1.nss
    else if(nEvent == 1006)
    {
        int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();

         // * generic surrender should only fire once
        if((GetIsDead(OBJECT_SELF) == FALSE) && (nCurrHP <= 10) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0 && GetMaster() == OBJECT_INVALID)
        //{
        // Debug
        // if((GetIsDead(OBJECT_SELF) == FALSE) && (nCurrHP <= nMaxHP) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {

            SetLocalInt(GetModule(), "HX_ARIBETH_ATTACKS", FALSE);
            DelayCommand(1.0, SetLocalInt(OBJECT_SELF, "Generic_Surrender",1));
            SurrenderToEnemies();
            AssignCommand(GetLastDamager(), ClearAllActions(TRUE));
            DelayCommand(1.5, SetImmortal(OBJECT_SELF, FALSE));
            ClearAllActions(TRUE);
            if(GetLocalInt(OBJECT_SELF, "nDoOnce") == 0)
            {
                SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
                DelayCommand(1.5, SpeakOneLinerConversation());
            }
            //GiveXPToCreature(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), 10 * FloatToInt(GetChallengeRating(OBJECT_SELF)));
        }
    }
    else if(nEvent == 1005) // ATTACKED
    {
        int iThaw = GetLocalInt(OBJECT_SELF, "bThawed");

        if(iThaw == FALSE)
        {
            ClearAllActions(TRUE);
            location lLoc = GetLocation(OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), OBJECT_SELF);
            SetImmortal(OBJECT_SELF, FALSE);
            SetIsDestroyable(TRUE, FALSE, FALSE);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc);
            DelayCommand(0.5, AssignCommand(GetLastAttacker(), ClearAllActions(TRUE)));
            DestroyObject(OBJECT_SELF, 0.6);
        }
    }
}
