//::///////////////////////////////////////////////
//:: Calibast Chosen
//:: q3ai_cal_chosen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast chosen as one of the henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "q_include"
void main()
{
    object oCal = GetObjectByTag("km_hen_cal");
    object oPC = GetFirstPC();
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    object oWay = GetObjectByTag("KMCUT3_STARTCAL");
    location lWay = GetLocation(oWay);
    object oCave = GetArea(oPC);
    int nChosen = GetLocalInt(oCave,"Q3AI_HENCH_CHOSEN")+1;

    object oModule = GetModule();
    int nNotChosen = GetLocalInt(oModule,"Q3AI_NOT_CHOSEN");

    if((nNotChosen - (nChosen-1)) > 0)
    {
        object oNewCal = CreateObject(OBJECT_TYPE_CREATURE,"os_hen_cal",lWay);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oCal);
        AssignCommand(oCal,SetIsDestroyable(TRUE,FALSE,FALSE));

        if(nChosen >=2)
        {
            ExecuteScript("km_cut3prep", GetModule());
        }

        SetLocalInt(oCave,"Q3AI_HENCH_CHOSEN",nChosen);
        SetLocalInt(oPC,"Q3AI_CAL_CHOSEN",10);
        q3_CheckChosen();

        GiveXPToCreature(oPC, 200);
        GiveXPToCreature(oNewCal, GetXP(oPC));
        LevelUpHenchman(oNewCal);
        LevelUpHenchman(oNewCal);
        LevelUpHenchman(oNewCal);

        DelayCommand(0.4,DestroyObject(oCal));
        DelayCommand(0.5,DestroyObject(OBJECT_SELF));
        AssignCommand(GetModule(), DelayCommand(1.0, AddHenchman(oPC, oNewCal)));
    }
    else
    {
        string sMSG;
        sMSG = "Your Magic Weapon requires the soul of one of your other followers before Calibast can be resurrected.";
        FloatingTextStringOnCreature(sMSG, oPC);
    }
}
