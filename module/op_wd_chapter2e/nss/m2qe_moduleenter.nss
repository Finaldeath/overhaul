//::///////////////////////////////////////////////
//:: m2qE Module Enter Script (OnClientEnter)
//:: m2qE_ModuleEnter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Provides the initial journal entry on entering
    the module
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 7, 2002
//:://////////////////////////////////////////////

void DeleteItem(string sTag);

void main()
{
    object oPC = GetEnteringObject();

    //AddJournalQuestEntry("m2qE_Main", 10, oPC);
//    ActionCastSpellAtObject(SPELL_GREATER_RESTORATION,oPC,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    AddJournalQuestEntry("m2q0_Main",45,oPC);

//    DeleteItem("AARIN_AMULET");
    DeleteItem("M2Q1ITALHTOOTH");
    DeleteItem("m2q3H_LetterFire");
    DeleteItem("M2Q3H_LETTERGhost");
    DeleteItem("m2q3H_LetterJustice");
//    DeleteItem("ARIBETH_RING");
    DeleteItem("M2Q2JKEY");
    DeleteItem("m2q3H_JudgmentKey");
    DeleteItem("m2q3H_RiddleKey");
    DeleteItem("m2q3I_KarlatKey");
    DeleteItem("M2Q3I_QuintKey");
    DeleteItem("M2Q05ICRYSEGG");
    DeleteItem("M2Q05ICRYSFROG");
    DeleteItem("M2Q05ICRYSINSECT");
    DeleteItem("M2Q05ICRYSSKULL");
    DeleteItem("M2Q04IDELILAHEAR");
    DeleteItem("M2Q5DERGIABHEAD");
    //DeleteItem("M2Q06IAARINPASS");
    DeleteItem("M2Q2CBOOKMORAG");
    DeleteItem("M2Q05IDUNGEONKEY");
    DeleteItem("M2Q3IGULGHEART");
    DeleteItem("M2Q2CCRBOOK");
    DeleteItem("M2Q2CBKTOMB");
    DeleteItem("M2Q05ILEAHRING");
    DeleteItem("m2q3H_LetterRiddle");
    DeleteItem("M2Q06ILETTNEVA");
    DeleteItem("m2q3J_QuintLett");
    DeleteItem("M2Q06ILETTSOLOMO");
    DeleteItem("M2Q05IGRAVEKEY");
    DeleteItem("M2Q3E_BROOCH");
    DeleteItem("M2Q01IYESGARKEY");
    DeleteItem("M2Q05IDOORPUZKEY");
    DeleteItem("M2Q2ARRING");
    DeleteItem("M2Q2J7KEY");
    DeleteItem("IT_SMLMISC001");
    DeleteItem("HEAD_m2q3E_Pete");
    DeleteItem("M2Q03ISTIRGEEAR");
    DeleteItem("m2q3I_JournKarlat");
    DeleteItem("M2Q3J_JOURNQuint");
    DeleteItem("M2Q3_OATHBELIAL");
    DeleteItem("M2Q3_OATHKARLAT");
    DeleteItem("M2Q3_OATHQUINT");
    DeleteItem("m2q3_Phylactery");
    DeleteItem("M2Q05ITOMBKEY");
    DeleteItem("M2Q2ITTREATSPIRIT");
    DeleteItem("HEAD_M2Q2ALENT");
    DeleteItem("M2Q2ITKEYTROLL");
    DeleteItem("M2Q3IWANEVCOTKEY");
    DeleteItem("M2Q3IWANEVSUMKEY");
    DeleteItem("M2Q01IWARDWANEV");
    DeleteItem("M2Q02IWYVERNEAR");
    DeleteItem("M2Q05IYESGAREAR");
    DeleteItem("M2Q5YesgKey");
    DeleteItem("M2Q05IZAMITHKEY");
    DeleteItem("M2Q05IZAMITHKEY2");
    DeleteItem("M2Q05IZOREAR");
    DeleteItem("m2q3E_WolfPelt");
    DeleteItem("M2Q01IDYDDJOUR");
    DeleteItem("M2Q5CULTJRNL");
    DeleteItem("M2Q01TIMASKDEATH");
    DeleteItem("M2Q01TIMASKFIRE");
    DeleteItem("M2Q01TIMASKICE");
    DeleteItem("M2Q01TIMASKLIFE");
    DeleteItem("M2Q01TIMASKRESON");
    DeleteItem("M2Q1SRLIMASKRESO");
    DeleteItem("M2Q1SRLIMASKFIRE");
    DeleteItem("M2Q1SRLIMASKICE");
    DeleteItem("M2Q1SRLIMASKLIFE");
    DeleteItem("M2Q1SRLIMASKDETH");
    DeleteItem("M2Q5XKARFRAG");
    DeleteItem("M2Q1ITKARJOURN");
    DeleteItem("M2Q2GJRNRELMAR");
    DeleteItem("M2Q3IWANEVBEDJOU");
    DeleteItem("M2Q3IWANEVCOOK");
    DeleteItem("M2Q3IWANEVLABJOU");
    DeleteItem("M2Q1ITGEMSETARA");
    DeleteItem("M2Q1ITGEMWANEV");
    DeleteItem("M2Q1ITGEMSHART");
    DeleteItem("M2Q1ITRING02");
    // * July 2 2002
    // * Druid rings should NOT be removed - Brent
    //DeleteItem("M2Q2E_RING4");
    //DeleteItem("M2Q2E_RING1");
    //DeleteItem("M2Q2E_RING3");
    //DeleteItem("M2Q2E_RING2");
    DeleteItem("M2Q1ITRING03");
    DeleteItem("M2Q2CC06_SIGNET");
    DeleteItem("M2Q06ITWILRING");
    DeleteItem("M2Q1ITRING01");
    DeleteItem("M2Q2CD07_SCROLL");
    DeleteItem("M2Q2CE_CSCROLL1");
    DeleteItem("M2Q2CE_HSCROLL1");
    DeleteItem("M2Q2CE_HSCROLL2");
    DeleteItem("M2Q2ITMIRRORVAN");
    DeleteItem("M2Q2CC_KEY");
    DeleteItem("M2Q2CD_KEY");
    DeleteItem("M2Q2CE_KEY");
    DeleteItem("M2Q2CE_TJRNL");
    DeleteItem("M2Q2BB14_KEY");
    DeleteItem("M2Q2ITNOTETROLL");
    DeleteItem("M2Q3G_CULTJOURN");
    DeleteItem("M2Q2F2_POISON");
    DeleteItem("M2Q2G_ANTIDOTE");
    DeleteItem("M2Q2ITTREATSPIRI");
    DeleteItem("M2Q2_NymphDagger");
    DeleteItem("m2q3kscroll");
    DeleteItem("M2Q3KEXPJOURN");
}

void DeleteItem(string sTag)
{
    object oItem = GetItemPossessedBy(GetEnteringObject(), sTag);
    if(GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
        DelayCommand(0.03, DeleteItem(sTag));
    }
}
