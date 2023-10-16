//::///////////////////////////////////////////////
//:: Kaidala Chosen
//:: q3ai_kai_chosen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala chosen as one of the henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "q_include"
void main()
{
    object oSoul = GetObjectByTag("q1_soulharvester");
    object oKai = GetObjectByTag("km_hen_kai");
    object oPC = GetFirstPC();
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    object oWay = GetObjectByTag("KMCUT3_STARTKAI");
    location lWay = GetLocation(oWay);
    object oCave = GetArea(oPC);
    int nChosen = GetLocalInt(oCave,"Q3AI_HENCH_CHOSEN")+1;

    object oModule = GetModule();
    int nNotChosen = GetLocalInt(oModule,"Q3AI_NOT_CHOSEN");

    if((nNotChosen - (nChosen-1)) > 0)
    {
        object oNewKai = CreateObject(OBJECT_TYPE_CREATURE,"os_hen_kai",lWay);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oKai);
        AssignCommand(oKai,SetIsDestroyable(TRUE,FALSE,FALSE));

        if(nChosen >=2)
        {
            ExecuteScript("km_cut3prep", GetModule());
        }

        SetLocalInt(oCave,"Q3AI_HENCH_CHOSEN",nChosen);
        SetLocalInt(oPC,"Q3AI_KAI_CHOSEN",10);
        q3_CheckChosen();
        DestroyObject(oSoul);

        GiveXPToCreature(oPC, 200);
        GiveXPToCreature(oNewKai, GetXP(oPC));
        LevelUpHenchman(oNewKai);
        LevelUpHenchman(oNewKai);
        LevelUpHenchman(oNewKai);

        DelayCommand(0.4,DestroyObject(oKai));
        DelayCommand(0.5,DestroyObject(OBJECT_SELF));
        AssignCommand(GetModule(), DelayCommand(1.0, AddHenchman(oPC, oNewKai)));
    }
    else
    {
        string sMSG;
        sMSG = "Your Magic Weapon requires the soul of one of your other followers before Kaidala can be resurrected.";
        FloatingTextStringOnCreature(sMSG, oPC);
    }
}
