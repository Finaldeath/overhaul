#include "help_general"
#include "help_hench"

void MakeSleep(object o)
{
    object oPC = GetFirstPC();

    if (GetJournalQuestState("JT_PREL_MARK", oPC) < 9)
    {
        SetLocalInt(o, "N_ASLEEP", 1);
        SetPlotFlag(o, FALSE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(), o, 6.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_SLEEP), o, 6.0);
        DelayCommand(0.7, SetPlotFlag(o, TRUE));
    }

    else
    {
        RemoveAllEffects(o);
        SetLocalInt(o, "N_ASLEEP", 0);
    }

    DelayCommand(6.0, MakeSleep(o));
}

void main()
{
    object o = GetEnteringObject();

    if (GetTag(o) == "CT_UNIQ_SH_VARH")
    {
        MakeSleep(o);
    }

    if (GetIsPC(o))
    {
        object oVarh = GetNearestObjectByTag("CT_UNIQ_SH_VARH");

        if (GetLocalInt(oVarh, "N_ASLEEP") == 1)
        {
            switch (GetLocalInt(o, "N_VAHR_STATE"))
            {
                // Kara has drugged him
                case 1: SceneSpeak(o, "[Chancellor Varhun lies unconcious upon the floor of his bedchamber, drugged by Kara after she enticed him into the room...]");
                break;

                // Fire was set
                case 2: SceneSpeak(o, "[While it seems the fire has died down to a still, Varhun lies unconcious upon the floor from too much exposure to the smoke of the flames...]");
                break;

                // Charmed by PC
                case 3: SceneSpeak(o, "[Under the fast effects of your spell, Varhun lies happily asleep upon the cold stone floor of his chamber...]");
                break;

                default: SceneSpeak(o, "[BUG!!!  Report to Developer!]");
                break;
            }
        }
    }
}
