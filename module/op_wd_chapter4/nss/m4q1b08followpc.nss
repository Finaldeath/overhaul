// * Follow player back to the hotel
#include "M4PLOTINCLUDE"

void main()
{
    if (GetIsObjectValid(GetLocalObject(GetModule(), "NW_G_M4Q01PLOTLEESA_SAVIOUR")) == TRUE
     && GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE") <2 && GetLocalInt(OBJECT_SELF,"NW_G_M4LEESA_FOLLOW") ==0)
    {
       FollowPlayer(GetLocalObject(GetModule(), "NW_G_M4Q01PLOTLEESA_SAVIOUR"));
    }
}
