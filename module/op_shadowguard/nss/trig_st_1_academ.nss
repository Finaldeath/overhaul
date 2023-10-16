#include "help_general"
#include "help_hench"
void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        string s;

        if (GetJournalQuestState("JT_ST_1_MAIN", oPC) < 6)
            s = "[You see the tired survivors among the Imperial citizens hiding away in the shelter of the Academy, their eyes full of fright...]";

        else
            s = "[With the fall of the magical seal around the Market District gate, it seems the Imperial citizens have fled the Academy...]";

        SceneSpeak(oPC, s);
    }
}
