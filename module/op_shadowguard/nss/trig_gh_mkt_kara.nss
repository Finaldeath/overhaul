#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            object oKara = GetNearestObjectByTag("HENCH_KARA", oPC);

            if (GetArea(oPC) == GetArea(oKara))
            {
                float fDelay = 6.0;

                object oNelgir = GetNearestObjectByTag("CT_COMM_NT_MRGM", oPC);

                AssignCommand(oKara, PlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, fDelay * 2));

                SceneSpeak(oKara, "[You see a beautiful, sultry Elven maiden attempting to haggle the price of a gem with a local merchant...]");

                DelayCommand(fDelay, SceneSpeak(oKara, "Come now... can't a handsome young fellow such as yourself give a lady a bargain?"));

                DelayCommand(fDelay * 2, SceneSpeak(oNelgir, "Save your charms for someone else!  The price is 300 gold pieces, and you can either take it or leave it!"));

                SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
            }
        }

        else if (GetJournalQuestState("JT_PREL_KARA", oPC) == 10)
        {
            object oGuard = GetNearestObjectByTag("CT_COMM_IM_PRKA");

            SceneSpeak(oGuard, "By order of Rakha's Law, we hereby place you, Nelgir, under arrest on the charge of murder...");
        }
    }
}
