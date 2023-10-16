//::///////////////////////////////////////////////
//:: Name: q2a_hb_ypattack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if any enemies are left alive -
    if not - change the attack variable so that
    Durnan and the 4 adventurers will go downstairs
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 26/02
//:://////////////////////////////////////////////


void main()
{

    //Cutscene 1 special effects
    //if we are during the attack
    if (GetLocalInt(GetModule(), "X2_ypattack") != 1)
        return;

        //Check to see if there are still enemies alive
        if (GetLocalInt(GetModule(), "X2_ncut1mobcount") < 1)
        {
            //if there are not - set a variable to get the 4 adventurers and
            //Durnan to go downstairs and get White resurrecting any dead
            SetLocalInt(GetModule(), "X2_ypattack", 2);

            //Change the Music
            MusicBattleStop(OBJECT_SELF);
            MusicBackgroundChangeDay(OBJECT_SELF, TRACK_TAVERN3);
            MusicBackgroundChangeNight(OBJECT_SELF, TRACK_TAVERN3);
            MusicBackgroundPlay(OBJECT_SELF);
        }


}
