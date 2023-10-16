// * Asheera follows player
#include "M4PLOTINCLUDE"
void main()
{
    if (GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_M4Q01PLOT_ALLY")) == TRUE)
    {
        FollowPlayer(GetLocalObject(OBJECT_SELF,"NW_L_M4Q01PLOT_ALLY"));
    }
}
