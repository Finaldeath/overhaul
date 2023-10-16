// on-enter event for level 2 of the cult temple.
#include "x2_inc_restsys"


void main()
{
    if (GetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT") != TRUE)
    {
        SetLocalString(OBJECT_SELF, "X2_WM_ENCOUNTERTABLE", "CultTempleCellar");
        //SetLocalInt(OBJECT_SELF, "X2_WM_AREA_USEDOORS", 0);
        SetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT",TRUE);
    }

}
