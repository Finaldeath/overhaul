#include "help_general"

// Globals
int PREL_MARK = 0;
int PREL_LYEN = 1;
int PREL_KARA = 2;
int PREL_TARI = 3;
int PREL_BRUK = 4;

void DoAITriggerSpeak(object o)
{
    object oPC = GetFirstPC();

    string sName = GetName(oPC);

    int n;
    string s;

    if (GetTag(o) == "CT_UNIQ_SG_MARK")
        n = PREL_MARK;

    else if (GetTag(o) == "CT_UNIQ_SG_LYEN")
        n = PREL_LYEN;

    else if (GetTag(o) == "CT_UNIQ_SG_KARA")
        n = PREL_KARA;

    else if (GetTag(o) == "CT_UNIQ_SG_TARI")
        n = PREL_TARI;

    else if (GetTag(o) == "CT_UNIQ_SG_BRUK")
        n = PREL_BRUK;

    switch (n)
    {
        case 0:
            s = sName + ", this way!";
            break;

        default:
            s = "";
            break;
    }

    SceneSpeak(o, s);
}
