#include "help_general"
#include "help_hench"
#include "inc_rob"

void DoSpeech(object oPC, object oSelf)
{
    //Set a variable to declare the cutscene as having started.
    SetLocalInt(GetArea(OBJECT_SELF), "bCP_CutsceneStarted", TRUE);

    BeginCutscene(oPC, "sc_st_0_cp");

    //Ensure that the player's facing the right way
    object oWP_PC = GetNearestObjectByTag("WP_CUTSCENE");
    AssignCommand(oPC, SetFacing(GetFacing(oWP_PC)));

    object oWP;
    location lWP;
    object o;
    effect e;
    string s = "CT_UNIQ_NT_CRIM";

    object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK");

    oWP = GetNearestObjectByTag("WP_" + s, oPC);
    lWP = GetLocation(oWP);

    e = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    e = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    object oCP = CreateCreatureOnWP(s, oPC);

    oWP = GetNearestObjectByTag("WP_AFTER_CP_SPEECH", oPC);

    o = oHarkon;
    AssignCommand(o, SetFacing(GetFacing(oWP)));

    o = GetFirstObjectInArea();

    //Ensure that the player's facing the right way
    vector vCP = GetPositionFromLocation(GetLocation(oCP));
    AssignCommand(oPC, SetFacingPoint(vCP));

    int nRand;

    while (o != OBJECT_INVALID)
    {
        if (GetTag(o) == "CT_COMM_NT_GHCM")
        {
            SetLocalInt(o, "N_DONT_RAND", 1);
            AssignCommand(o, ClearAllActions());

            AssignCommand(o, SetFacingPoint(vCP));

            nRand = Random(100);

            if (nRand > 30)
                SceneSpeak(o, "What in the name of the gods is that?!");
        }

        o = GetNextObjectInArea();

    }
}

void main()
{
    object oPC = GetEnteringObject();

    if ((GetIsPC(oPC) == TRUE) && (GetIsPossessedFamiliar(oPC) != TRUE))
    {
        //Get the father journal entry
        int iDadState = Rob_GetJournalState(oPC, "JT_ST_0_MAIN");

        //Get the henchmen journal entries
        int iLyenState = Rob_GetJournalState(oPC, "JT_PREL_LYEN");
        int iKaraState = Rob_GetJournalState(oPC, "JT_PREL_KARA");
        int iTarinState = Rob_GetJournalState(oPC, "JT_PREL_TARI");

        //Only trigger the Crimson Prophet Cutscene if the various plots
        //are at appropriate points.
        if (iDadState < 5 &&      //CP cutscene hasn't fired yet;
            iLyenState >= 20 &&   //Slavers fully dealt with;
            iKaraState >= 6 &&   //Kara has entered her trance;
            ((iTarinState >= 5 && //(EITHER(Player has dealt with the brooch quest in some fashion
             iTarinState <= 9) || //AND Pharos has not yet captured Tarin)
             iTarinState >= 15))  //OR Tarin has been rescued))
        {
            DoSpeech(oPC, OBJECT_SELF);
        }
    }
}
