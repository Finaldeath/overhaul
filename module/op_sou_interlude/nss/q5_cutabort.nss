//::///////////////////////////////////////////////
//:: Name  q1_cutabort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort for Heurdis leaving portal dungeon
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 124/3/2003
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "x1_inc_cutscene"
#include "nw_i0_generic"

void RemoveEffects(object oCreature)
{
    object oTrig = GetLocalObject(GetModule(), "Q3B_CUTSCENE5_TRIGGER");
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if(GetEffectCreator(eEff1) == oTrig)
            RemoveEffect(oCreature, eEff1);
        eEff1 = GetNextEffect(oCreature);
    }
}

void UnfreezeAll(object oPC)
{
    int n;
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
    while (oCreature != OBJECT_INVALID)
    {
        RemoveEffects(oCreature);
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
        n++;
    }
}

void DestroyPCCopy()
{
    object oCopy = GetLocalObject(GetModule(), "Q3B_PC_COPY5");
    SetPlotFlag(oCopy, FALSE);
    DestroyObject(oCopy);
}

void DeactivatePortal()
{
        int i;
        object oObelisk;
        object oTarget;
        float fDelay = 0.0;
        object oPortalSound = GetNearestObjectByTag("Q3B_SOUND_PORTAL");
        SoundObjectStop(oPortalSound);
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        for(i = 1; i <=6; i++)
        {
            fDelay += 1.0;
            oObelisk = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(i));
            oTarget = GetNearestObjectByTag("Q3B_INV_PORTAL", oObelisk);
            DelayCommand(fDelay, RemoveEffects(oObelisk));
            DelayCommand(fDelay, RemoveEffects(oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oObelisk));
            PlaySound("sce_negative");
        }
}

void main()
{
    object oPC = GetFirstPC();
    object oHeurodis = GetNearestObjectByTag("Q3B_HOODED_FIGURE");
    object oPortal = GetNearestObjectByTag("Q3B_SAND_PORTAL", oPC);
    DestroyObject(oHeurodis);
    DeactivatePortal();
    DestroyObject(oPortal);
    //DestroyPCCopy();
    DelayCommand(3.0, UnfreezeAll(oPC));
    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
    while (oPC != OBJECT_INVALID)
    {
        CutRestoreLocation(5, 2.0, oPC);
        //CutRemoveEffects(5, 0.5, oPC);
        DelayCommand(2.0, RemoveEffects(oPC));
        CutSetCutsceneMode(5, 2.5, oPC, FALSE);
        DelayCommand(3.0, SetLocalInt(oPC, "nCutsceneNumber", 0));
        UnFreezeAssociate(oPC);
        oPC = GetNextPC();
    }

    SetLocalInt(GetModule(), "X1_CUT5RUNNING", 2); // change cutscene status
}

