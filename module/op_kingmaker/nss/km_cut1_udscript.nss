//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
void main()
{
    // enter desired behaviour here
    int nUser = GetUserDefinedEventNumber();

    if((nUser == 4444 )
    && (GetIsReactionTypeHostile(GetFirstPC()) == FALSE))
    {
        //Do A battle cry sound
        if(GetResRef(OBJECT_SELF) == "nw_goblina")
        {
            PlaySound("c_goblin_bat1");
        }
        else if (GetResRef(OBJECT_SELF) == "nw_goblinb")
        {
            PlaySound("c_goblin_bat2");
        }
        else if (GetResRef(OBJECT_SELF) == "nw_orca")
        {
            PlaySound("c_orc_bat1");
        }
        else if (GetResRef(OBJECT_SELF) == "nw_orcb")
        {
            PlaySound("c_orc_bat2");
        }

        //Do some animations
        DelayCommand(IntToFloat(Random(5))/5,
            ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 0.7f));
        DelayCommand(IntToFloat(Random(10))/5,
            ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 0.7f));
        DelayCommand(IntToFloat(Random(20))/5,
            ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 0.7f));
        DelayCommand(IntToFloat(Random(30))/5,
            ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 0.65f));

        DelayCommand(IntToFloat(Random(40))/5, SignalEvent(OBJECT_SELF, EventUserDefined(4444)));

    }
    return;

}
