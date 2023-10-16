//::///////////////////////////////////////////////
//:: Default On Percieve
//:: q2a_perceive_ref
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 22/03
//:://////////////////////////////////////////////



void main()
{

    //If the last perception event was an enemy - run away screaming
    if (GetIsEnemy(GetLastPerceived()))
    {
        object oEnemy = GetLastPerceived();
        switch (Random(3) + 1)
        {
            case 1: SpeakStringByStrRef(83993);
                        break;
            case 2: SpeakStringByStrRef(83994);
                        break;
            case 3: SpeakStringByStrRef(83995);
                        break;
        }
        ActionMoveAwayFromObject(oEnemy,TRUE,40.0);

    }

}


