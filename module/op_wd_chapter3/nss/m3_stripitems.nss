//::///////////////////////////////////////////////
//:: M3_STRIPITEMS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Strips items from chapter 2E when entering the module
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

void Strip2EItems(string sTag)
{
    if(GetIsPC(GetEnteringObject()))
    {
        object oPC = GetEnteringObject();
        object oItem = GetItemPossessedBy(oPC,sTag);
        if (GetIsObjectValid(oItem))
        {
            DestroyObject(oItem);
            DelayCommand(0.03,Strip2EItems(sTag));
        }
    }
}
void main()
{
    Strip2EItems("2Q4F_GhoulAmu");
    Strip2EItems("2Q4_BaramBaseKey");
    Strip2EItems("2Q4_KurthBaseKey");
    Strip2EItems("M2Q4A_Child_Toy");
    Strip2EItems("2Q4_ErbsRing");
    Strip2EItems("2Q4_GlowSphere");
    Strip2EItems("2Q4_PlanarToken");
    Strip2EItems("2Q4F_MachKey");
    Strip2EItems("2Q4A_Londa_Key");
    Strip2EItems("2Q4_YvettesBaby");
    Strip2EItems("2Q4_Sewage");
    Strip2EItems("2Q4_LEVERSTONE");
    Strip2EItems("2Q4_LEVERWATER");
    Strip2EItems("2Q4_LEVERWIND");
    Strip2EItems("Elynwyd_Ring");
    Strip2EItems("2Q4_WizardBook");
    Strip2EItems("2Q4_NecroParchment");
    Strip2EItems("2Q4_NecroJournal");
    Strip2EItems("2Q4_BaramHead");
    Strip2EItems("2Q4_KurthHead");
    Strip2EItems("2Q4D_PrisonKey");
    Strip2EItems("2Q6B_AribethDiar");
    Strip2EItems("2Q6B_SecureKey");
//    Strip2EItems("2Q6_Stone01");
//    Strip2EItems("2Q6_Stone02");
    Strip2EItems("2Q6_STONE03");
    Strip2EItems("2Q6_STONE04");
    Strip2EItems("2Q6_STONE05");
    Strip2EItems("2Q6_STONE06");
    Strip2EItems("2Q6_STONE07");
    Strip2EItems("2Q6_STONE08");
    Strip2EItems("2Q6_STONE09");
//    Strip2EItems("2Q6_Stone10");
    Strip2EItems("2Q6_BloodWar");
    Strip2EItems("2Q6_ImpGore");
    Strip2EItems("2Q6_QuasitGore");
    Strip2EItems("2Q6E_ControlRod");
    Strip2EItems("2Q6G_Discipline");
    Strip2EItems("2Q6_Letter02");
    Strip2EItems("2Q6_MaugrimLette");
    Strip2EItems("2Q6_MaugrimJournal");
    Strip2EItems("2Q6_LetterGolem");
    Strip2EItems("2Q6K_GrandStone");
    Strip2EItems("2Q6_LabNotes");
    Strip2EItems("2Q6H_PrisonKey");
    Strip2EItems("M2Q6A0SEAL");
    Strip2EItems("M2Q06IAARINPASS");
    Strip2EItems("2Q4_Orders");
    Strip2EItems("2Q6_PortalInst");
}
