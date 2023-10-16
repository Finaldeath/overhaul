#include "NW_I0_GENERIC"
#include "help_general"
#include "help_hench"

void main()
{
    object oWP;
    location lWP;
    object o;
    object oPC = GetPCSpeaker();
    object oSelf = OBJECT_SELF;

    SetPlotFlag(OBJECT_SELF, FALSE);

    ChangeToStandardFaction(oSelf, STANDARD_FACTION_HOSTILE);
    AdjustReputation(oPC, oSelf, -100);
    SetIsTemporaryEnemy(oPC);
    SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 0, oSelf);

    AssignCommand(OBJECT_SELF, ActionEquipMostDamagingMelee(oPC));

    if (GetHasFeat(FEAT_AMBIDEXTERITY) || GetHasFeat(FEAT_TWO_WEAPON_FIGHTING))
        AssignCommand(OBJECT_SELF, ActionEquipMostDamagingMelee(oPC, TRUE));

    DelayCommand(1.0, AssignCommand(OBJECT_SELF, ActionAttack(oPC)));

    int i;

    for (i = 1; i <= 2; i++)
    {
        oWP = GetNearestObjectByTag("WP_CT_COMM_CH_ASSA", OBJECT_SELF, i);
        lWP = GetLocation(oWP);
        o = CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_CH_ASSA", lWP);
        ChangeToStandardFaction(o, STANDARD_FACTION_HOSTILE);
        SetIsTemporaryEnemy(oPC, o);
        AssignCommand(o, ActionAttack(oPC));
    }

    o = SpawnHenchman(oPC, "HENCH_MARK");

    AdjustReputation(o, oSelf, -100);

    AssignCommand(o, ActionEquipMostDamagingMelee());

    DelayCommand(1.0, SceneSpeak(o, "[Markius Albright suddenly emerges from the shadows nearby, unsheathing his massive blade as he comes rushing to your aid...]"));

    DelayCommand(1.0, AssignCommand(o, ActionAttack(oSelf)));

    SetLocalInt(GetModule(), "XANTHAR_ATTACKS", TRUE);
}
