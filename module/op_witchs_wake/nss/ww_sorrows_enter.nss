//::///////////////////////////////////////////////
//:: Witchwork: Plane of Sorrows OnEnter
//:: WW_Sorrows_Enter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Makes the PC and all her associates
     invulnerable. This state is removed in the
     area's OnExit script.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void DMInform(object oEnterer)
{
    //Only track player movement.
    if (GetIsPC(oEnterer) == TRUE)
    {
        string sCharName = GetName(oEnterer);
        string sPlayerName = GetPCPlayerName(oEnterer);
        string sAreaName = GetName(OBJECT_SELF);
        string sAreaTag = GetTag(OBJECT_SELF);

        //Build and send message...
        SendMessageToAllDMs(sCharName+" ("+sPlayerName+") has entered "+
                            sAreaName+" ("+sAreaTag+").");
    }
}

void main()
{
    object oEnterer = GetEnteringObject();

    //Inform DM of player movement
    DMInform(oEnterer);

    if (GetIsPC(oEnterer) == TRUE)
    {
//////////Behavior specific to the Plane of Sorrows...
        object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oEnterer);
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oEnterer);
        object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oEnterer);
        effect eHealPC = EffectHeal(GetMaxHitPoints(oEnterer)+10);
        effect eHealHenchman = EffectHeal(GetMaxHitPoints(oHenchman)+10);
        effect eHealFamiliar = EffectHeal(GetMaxHitPoints(oFamiliar)+10);
        effect eHealAnimalCompanion = EffectHeal(GetMaxHitPoints(oAnimalCompanion)+10);

        //Flag them as invulnerable
        SetPlotFlag(oEnterer, TRUE);
        SetPlotFlag(oHenchman, TRUE);
        SetPlotFlag(oFamiliar, TRUE);
        SetPlotFlag(oAnimalCompanion, TRUE);

        //Clear their combat state so they can talk to the door if they need to.
        AssignCommand(oEnterer, ClearAllActions(TRUE));

        //Do a delayed effects removal on them to catch any rare timing issues
        //that might leave them pooched in this area.
        DelayCommand(10.0, RemoveEffects(oEnterer));
        DelayCommand(10.0, RemoveEffects(oHenchman));
        DelayCommand(10.0, RemoveEffects(oFamiliar));
        DelayCommand(10.0, RemoveEffects(oAnimalCompanion));

        //Do a delayed healing on them to catch any rare timing issues that
        //might leave them dead in this area.
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealPC, oEnterer));
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealHenchman, oHenchman));
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealFamiliar, oFamiliar));
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealAnimalCompanion, oAnimalCompanion));

        //Do a delayed ForceRest on them so they recover their spells & abilities.
        DelayCommand(10.0, ForceRest(oEnterer));
        DelayCommand(10.0, ForceRest(oHenchman));
        DelayCommand(10.0, ForceRest(oFamiliar));
        DelayCommand(10.0, ForceRest(oAnimalCompanion));

        //If they're greater than 3 deaths, reapply the Ghost VFX
        int iDeaths = GetLocalInt(oEnterer, "iDeaths");
        if (iDeaths > 3)
        {
            effect eGhost = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
            DelayCommand(10.1, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oEnterer));
        }
    }
}
