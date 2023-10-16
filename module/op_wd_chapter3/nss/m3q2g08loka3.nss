//* Lokar gaves player his ring
#include "M3PLOTINCLUDE"

void main()
{
    if(GetLocalInt(GetPCSpeaker(),"NW_G_M3Q2G_LOKARRING")==0)
    {
        GivePlayerLokarRing(GetPCSpeaker());
        SetLocalInt(GetPCSpeaker(),"NW_G_M3Q2G_LOKARRING",1);
    }
}
