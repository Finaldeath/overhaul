#include "M1_Plot"
void main()
{
    object oExit = GetExitingObject();
    if(GetIsPC(oExit))
    {
        int nNth;
        object oDoor = GetObjectByTag("M1Q3COuterDoor",nNth);
        while(GetIsObjectValid(oDoor))
        {
            SetLocked(oDoor,FALSE);
            AssignCommand(oDoor,ActionOpenDoor(oDoor));
            nNth++;
            oDoor = GetObjectByTag("M1Q3COuterDoor",nNth);
        }
    }
}
