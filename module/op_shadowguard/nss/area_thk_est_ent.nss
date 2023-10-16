#include "help_general"
#include "help_hench"

void main()
{
    object o = GetEnteringObject();

    if (GetIsPC(o))
    {
        if (GetFirstTimeIn())
        {
            SceneSpeak(o, "[As you step foot onto the mainland before Thakaros Estate, you smell the heavy stench of rotting flesh permeating the air...]");

            SetTime(15, 0, 0, 0);

            AddJournalSingle("JT_ST_2_MAIN", 16, o);
        }
    }

    else if (GetStringLeft(GetTag(o), 7) == "CT_ZOMB")
    {
        if (GetLocalInt(GetModule(), "N_TEST") == 1)
            SendMessageToPC(GetFirstPC(), "[Day: Shouldn't be destroying a zombie...]");
    }
}
