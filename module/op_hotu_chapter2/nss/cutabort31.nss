// abort script for gong cutscene: jump to players into the temple when the cultists attack them.

#include "nw_i0_generic"

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    AmbientSoundChangeDay(GetArea(oPC), 65);
    AmbientSoundChangeNight(GetArea(oPC), 65);
    AmbientSoundPlay(GetArea(oPC));
    MusicBackgroundChangeDay(GetArea(oPC), TRACK_CITYSLUMNIGHT);
    MusicBackgroundChangeNight(GetArea(oPC), TRACK_CITYSLUMNIGHT);
    MusicBackgroundPlay(GetArea(oPC));

    object oArmand = GetObjectByTag("q3_armand");
    object oCultist1 = GetObjectByTag("q3a_cultist1");
    object oCultist2 = GetObjectByTag("q3a_cultist2");
    object oMonkWP1 = GetWaypointByTag("q3b_wp_cutjump2");
    object oMonkWP2 = GetWaypointByTag("q3b_wp_cutjump3");
    object oArmandJump = GetWaypointByTag("q3_wp_armand_sp");
    object oPlayerJump = GetWaypointByTag("q3b_wp_cutjump");

    object oTrap1 = GetObjectByTag("q3b_entrance_trap1");
    object oTrap2 = GetObjectByTag("q3b_entrance_trap2");
    object oTrap3 = GetObjectByTag("q3b_entrance_trap3");
    DestroyObject(oTrap1);
    DestroyObject(oTrap2);
    DestroyObject(oTrap3);

    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(2.5, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    DelayCommand(1.0, AssignCommand(oCultist1, JumpToObject(oMonkWP1)));
    DelayCommand(1.0, AssignCommand(oCultist2, JumpToObject(oMonkWP2)));
    DelayCommand(1.0, AssignCommand(oArmand, JumpToObject(oArmandJump)));
    DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oPlayerJump)));
    DelayCommand(1.0, AdjustReputation(oPC, oCultist1, -100));
    DelayCommand(1.0, AdjustReputation(oCultist1, oPC, -100));
    DelayCommand(5.0, AssignCommand(oCultist1, ActionAttack(oPC)));
    DelayCommand(5.0, AssignCommand(oCultist2, ActionAttack(oPC)));

    int i = 1;
    object oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
    while(i <= 10)
    {
        DelayCommand(1.0, AssignCommand(oSlave, SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, TRUE)));
        i++;
        oSlave = GetNearestObjectByTag("Q3A_SLAVE", oPC, i);
    }

}
