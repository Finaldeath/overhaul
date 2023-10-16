//::///////////////////////////////////////////////
//:: Make Colmarr Potion
//:: 2Q4_MakePotion
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes a potion from sewage
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 1, 2002
//:://////////////////////////////////////////////

#include "NW_I0_2Q4LUSKAN"
void main()
{
    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    DelayCommand(1.0,PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
    int nPlot = GetLocalInt(GetModule(), "NW_2Q4_COLMARR_LEVERS");
    if(nPlot == 3)
    {
        SetLocalInt(GetModule(),"Contrapulator_Fixed",1);
        //Set Colmarr Plot = 100;
        SetLocalInt(GetModule(), "NW_2Q4_COLMARR_LEVERS", 4);
    }
    int nPotions = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    if(nPotions < 30 && nPlot >= 1)
    {
        object oEngine = GetObjectByTag("2Q4_ColmarrEng");
        object oSpawn = GetObjectByTag("2Q4_PotionSpawn");
        effect eBeam = EffectVisualEffect(VFX_IMP_HOLY_AID);

        if(GetIsObjectValid(oEngine))
        {
            DelayCommand(1.0, CreateColmarrPotion());
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oSpawn);
            nPotions++;
            SetLocalPlotIntOnCharacter(OBJECT_SELF, nPotions);
        }
    }
}
