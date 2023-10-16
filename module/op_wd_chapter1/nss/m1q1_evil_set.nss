//:://////////////////////////////////////////////
/*
    set speaker to react negatively to player
    Closes off dialog options with player
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Mar 01, 2002
//:://////////////////////////////////////////////


#include "nw_i0_plot"

void main()
{

    SetLocalInt(OBJECT_SELF,"Evil",1);
    SetLocalObject(OBJECT_SELF,"Evil",GetPCSpeaker());

}

