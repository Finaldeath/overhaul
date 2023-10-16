//::///////////////////////////////////////////////
//:: Jaboli Chosen
//:: q3ai_jab_chosen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli chosen as one of the henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "q_include"
void main()
{
    object oJab = GetObjectByTag("km_hen_jab");
    object oPC = GetFirstPC();
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    object oWay = GetObjectByTag("KMCUT3_STARTJAB");
    location lWay = GetLocation(oWay);
    object oCave = GetArea(oPC);
    int nChosen = GetLocalInt(oCave,"Q3AI_HENCH_CHOSEN")+1;

    object oModule = GetModule();
    int nNotChosen = GetLocalInt(oModule,"Q3AI_NOT_CHOSEN");

    if((nNotChosen - (nChosen-1)) > 0)
    {
        object oNewJab = CreateObject(OBJECT_TYPE_CREATURE,"os_hen_jab",lWay);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oJab);
        AssignCommand(oJab,SetIsDestroyable(TRUE,FALSE,FALSE));

        if(nChosen >=2)
        {
            ExecuteScript("km_cut3prep", GetModule());
        }

        SetLocalInt(oCave,"Q3AI_HENCH_CHOSEN",nChosen);
        SetLocalInt(oPC,"Q3AI_JAB_CHOSEN",10);
        //sets that Jaboli is neutral to the pc
        SetLocalInt(GetFirstPC(), "OS_JAB_LIKE",50);
        q3_CheckChosen();

        GiveXPToCreature(oPC, 200);
        GiveXPToCreature(oNewJab, GetXP(oPC));
        LevelUpHenchman(oNewJab);
        LevelUpHenchman(oNewJab);
        LevelUpHenchman(oNewJab);

        DelayCommand(0.4,DestroyObject(oJab));
        DelayCommand(0.5,DestroyObject(OBJECT_SELF));
        AssignCommand(GetModule(), DelayCommand(1.0, AddHenchman(oPC, oNewJab)));
    }
    else
    {
        string sMSG;
        sMSG = "Your Magic Weapon requires the soul of one of your other followers before Jaboli can be resurrected.";
        FloatingTextStringOnCreature(sMSG, oPC);
    }
}
