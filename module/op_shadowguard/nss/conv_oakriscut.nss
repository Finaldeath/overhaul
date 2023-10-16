#include "help_hench"

void RemoveAllEffects(object oObject);

void main()
{
    object oPC = GetPCSpeaker();
    object oClone = GetObjectByTag("SG_OKARISCUTCLONE");
    location lClone = GetLocation(oClone);
    string sConv = GetLocalString(oPC, "S_CURR_CUTSCENE");

    object oVhorkas = GetNearestObjectByTag("CT_UNIQ_SH_VHOR", oPC);
    object oWP = GetNearestObjectByTag("WP_EXIT", oVhorkas);

    object oOkaris = GetNearestObjectByTag("CT_UNIQ_NT_OKAR", oPC);
    string sGender;


    SetLocalInt(oPC, "CUTSCENE_" + sConv, 1);
    FadeToBlack(oPC);
    DestroyObject(oClone, 1.0f);

    AddJournalSingle("JT_ST_0_MAIN", 10, oPC);

    SetLocalInt(oVhorkas, "N_DONT_SPEAK", 1);
    AssignCommand(oVhorkas, ActionMoveToObject(oWP));
    DestroyObject(oVhorkas, 4.0);

    DelayCommand(1.5f, SetCutsceneMode(oPC, FALSE));
    DelayCommand(1.5f, RemoveAllEffects(oPC));
    DelayCommand(1.5f, AssignCommand(oPC, JumpToLocation(lClone)));
    DelayCommand(2.0f, FadeFromBlack(oPC));


    if (GetGender(oPC) == GENDER_MALE)
        sGender = "son";
    else
        sGender = "daughter";

    DelayCommand(3.0f, AssignCommand(oOkaris, SpeakString("[" + GetName(oOkaris) + "] My " + sGender + "! I have been so worried about you! Come here and let your old father have a good look at you!")));
}

void RemoveAllEffects(object oObject)
{

    effect eEffect = GetFirstEffect(oObject);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if ((GetEffectType(eEffect) != EFFECT_TYPE_ABILITY_INCREASE)
        && (GetEffectType(eEffect) != EFFECT_TYPE_AC_INCREASE))
        {
            RemoveEffect(oObject, eEffect);
        }

        eEffect = GetNextEffect(oObject);
    }
}
