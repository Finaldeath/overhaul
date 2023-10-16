//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_outdevil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will fire the cutscene that will morph
     the PC during battle. This is done to show
     that the amulet they have is more than just
     an amulet.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 22, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void RemovePolymorph(object oPC);
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

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
        int iMax = GetMaxHitPoints();
        int iCurrent = GetCurrentHitPoints();
        object oInvis = GetObjectByTag("hx_cut_runner");
        int iDamage = GetLocalInt(GetModule(), "HX_DAMAGE_TIMES");
        int iAppearance = GetAppearanceType(GetFirstPC());
        //object oAmulet = GetItemPossessedBy(GetFirstPC(), "H2_SenseiAmulet");

        //if(!GetIsObjectValid(oAmulet))
        //{
        //    oAmulet == CreateItemOnObject("h2_senseiamulet", GetFirstPC());
        //}

        // Fire the cutscene.

        // Don't do damage in a cutscene.
        int iCut = CutGetActiveCutsceneForObject(GetFirstPC());
        if(iCut < 1)
        {
            if(iDamage == 0 && iCurrent <= iMax - 20)
            {
                RemovePolymorph(GetFirstPC());
                //SetLocalInt(OBJECT_SELF, "HX_DAMAGE_TIMES", 1);
                DelayCommand(1.0, SignalEvent(oInvis, EventUserDefined(4444)));
            }
            else if(iDamage == 1 && iCurrent <= iMax / 2)
            {
                RemovePolymorph(GetFirstPC());
                DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetFirstPC()));
                //SetLocalInt(OBJECT_SELF, "HX_DAMAGE_TIMES", 2);
                DelayCommand(1.0, SignalEvent(oInvis, EventUserDefined(5555)));
            }
            else if(iDamage == 2 && iCurrent < iMax / 4)
            {
                RemovePolymorph(GetFirstPC());
                DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetFirstPC()));
                //SetLocalInt(OBJECT_SELF, "HX_DAMAGE_TIMES", 3);
                SetLocalInt(GetModule(), "HX_SENSAI_AMULET", 1);
                //AddJournalQuestEntry("hx_sens_amulet", 20, GetFirstPC(), TRUE, TRUE);
                //AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyCastSpell(IP_CONST_CASTSPELL_UNIQUE_POWER_SELF_ONLY, IP_CONST_CASTSPELL_NUMUSES_UNLIMITED_USE), oAmulet);
                DelayCommand(1.0, SignalEvent(oInvis, EventUserDefined(6666)));
            }
        }
    }

    else if(nUser == 1007) // DEATH
    {
        AddJournalQuestEntry("XP2_Guardians", 30, GetFirstPC(), TRUE, TRUE);
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(4444));
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

void RemovePolymorph(object oPC)
{
    effect eEffect = GetFirstEffect(oPC);

    while(GetIsEffectValid(eEffect))
    {
        if(GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
}
