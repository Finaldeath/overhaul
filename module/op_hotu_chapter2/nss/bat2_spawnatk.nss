//::///////////////////////////////////////////////
//:: Name bat2_spawnatk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Spawn the attackers in..for Battle 2 (to kill the Seer)

*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 27/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"

void main()
{
    object oSeer = GetObjectByTag("q2aseer");

    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);

    if (GetLocalInt(oArea, "nSpawnedAttack") == 1)
        return;
    SetLocalInt(oArea, "nSpawnedAttack", 1);

    //Change Ambient sounds in the area
    AmbientSoundChangeDay(oArea, 24);
    AmbientSoundChangeNight(oArea, 24);
    AmbientSoundPlay(oArea);

    object oBattleMaster = GetObjectByTag("q2abattle2master");

    //WAVE 1  - Further Waves controlled by the Battlemaster's User Defined Script

    //Spawn in some Illithid and Umber Hulks - show via a cutscene
    //The Matron will have Illithid and Umber Hulks unless X2_Q2DOvermind > 0
   //bat2wp_mindflayerspawn1-5
    if (GetGlobalInt("X2_Q2DOvermind") < 2)
    {
        ExecuteScript("bat2_mindflayer", oBattleMaster);
        //When executed - after the cutscene this script will then check whether
        //the beholder spawn script should execute or just the regular
    }
    //The Matron will have beholders unless x2_plot_beholders_out has been set to 1
    //bat2wp_beholderspawn1-5
    //Spawn in some Beholders - show via cutscene
    else if (GetGlobalInt("x2_plot_beholders_out") == 0)
    {
        ExecuteScript("bat2_beholders", oBattleMaster);
        //When executed - after the cutscene - this script will spawn in the regular attackers

    }
    //else just spawn in the regular attackers and start the battle
    else
    {
        ExecuteScript("bat2_regulars", oBattleMaster);
    }

    //Keep track of formation count for dynamic squad creation
    SetLocalInt(GetModule(), "X2_Q2ABattle2FormCount", 7 );

    //Set a variable to show that battle 1 is ongoing
    SetLocalInt(GetModule(), "X2_Q2ABattle2Started", 1);


}


