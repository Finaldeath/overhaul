#include "help_general"
#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) && GetFirstTimeIn())
    {
        object oHench;

        string sTag;

        int i = 0;

        DelayCommand(6.0 * i++, SceneSpeak(oPC, "[As you enter through the gates, you notice with horror that a group of corpses walk towards you and your companions, some wearing Imperial uniforms, some the garbing of the Crimson Followers...]"));

        sTag = "HENCH_MARK";
        oHench = GetNearestObjectByTag(sTag);
        DelayCommand(6.0 * i++, SceneSpeak(oHench, "If my eyes do not deceive me, it appears the dead walk upon Thakaros Estate...  What manner of devilry is this?!  To me, Shadowguard!"));
        AssignCommand(oHench, DetermineCombatRound());

        sTag = "HENCH_LYEN";
        oHench = GetNearestObjectByTag(sTag);
        DelayCommand(6.0 * i++, SceneSpeak(oHench, "This affront to nature must not go unchecked..."));
        AssignCommand(oHench, DetermineCombatRound());

        sTag = "HENCH_KARA";
        oHench = GetNearestObjectByTag(sTag);
        DelayCommand(6.0 * i++, SceneSpeak(oHench, "I sense the work of Akhana at hand...  Only the Mistress of Death could call forth such a horde of the dead..."));
        AssignCommand(oHench, DetermineCombatRound());

        sTag = "HENCH_TARI";
        oHench = GetNearestObjectByTag(sTag);
        DelayCommand(6.0 * i++, SceneSpeak(oHench, "Ah, great...  Now we have to fight the dead as well as the living?  Oh, why oh why did I ever agree to this..."));
        AssignCommand(oHench, DetermineCombatRound());

        sTag = "HENCH_BRUK";
        oHench = GetNearestObjectByTag(sTag);
        DelayCommand(6.0 * i++, SceneSpeak(oHench, "We just bash them til they dead again!  Me not run from rotted corpse!"));
        AssignCommand(oHench, DetermineCombatRound());
    }
}
