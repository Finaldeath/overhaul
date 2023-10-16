#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            object oTari = GetNearestObjectByTag("HENCH_TARI", oPC);
            object oBruk = GetNearestObjectByTag("HENCH_BRUK", oPC);
            object oGhan = GetNearestObjectByTag("CT_UNIQ_NT_GHAN", oPC);

            string s;
            float offset = 6.0;

            s = "Ha! I win again! You two really need to learn how to play cards, particularly you, Lyen...  You dip your cards so low even I can see them...";
            SceneSpeak(oTari, s);

            s = "[Growl] You're not supposed to look at our cards, little Tarin...";
            DelayCommand(offset * 1, SceneSpeak(oBruk, s));

            s = "Grrr... Lucky little Halfling...";
            DelayCommand(offset * 2, SceneSpeak(oGhan, s));

            DelayCommand(offset * 2, SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1));
        }
    }
}
