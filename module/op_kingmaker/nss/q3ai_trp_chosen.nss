//::///////////////////////////////////////////////
//:: Trip Chosen
//:: q3ai_trp_chosen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip chosen as one of the henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "q_include"
void main()
{
    object oTrp = GetObjectByTag("km_hen_trp");
    object oPC = GetFirstPC();
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    object oWay = GetObjectByTag("KMCUT3_STARTTRP");
    location lWay = GetLocation(oWay);
    object oCave = GetArea(oPC);
    int nChosen = GetLocalInt(oCave,"Q3AI_HENCH_CHOSEN")+1;

    object oModule = GetModule();
    int nNotChosen = GetLocalInt(oModule,"Q3AI_NOT_CHOSEN");

    if((nNotChosen - (nChosen-1)) > 0)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTrp);
        AssignCommand(oTrp,SetIsDestroyable(TRUE,FALSE,FALSE));
        object oNewTrp = CreateObject(OBJECT_TYPE_CREATURE,"os_hen_trp",lWay);

        if(nChosen >=2)
        {
            ExecuteScript("km_cut3prep", GetModule());
        }

        SetLocalInt(oCave,"Q3AI_HENCH_CHOSEN",nChosen);
        SetLocalInt(oPC,"Q3AI_TRP_CHOSEN",10);
        q3_CheckChosen();

        GiveXPToCreature(oPC, 200);
        GiveXPToCreature(oNewTrp, GetXP(oPC));
        LevelUpHenchman(oNewTrp);
        LevelUpHenchman(oNewTrp);
        LevelUpHenchman(oNewTrp);

        DelayCommand(0.4,DestroyObject(oTrp));
        DelayCommand(0.5,DestroyObject(OBJECT_SELF));
        AssignCommand(GetModule(), DelayCommand(1.0, AddHenchman(oPC, oNewTrp)));
    }
    else
    {
        string sMSG;
        sMSG = "Your Magic Weapon requires the soul of one of your other followers before Trip can be resurrected.";
        FloatingTextStringOnCreature(sMSG, oPC);
    }
}
