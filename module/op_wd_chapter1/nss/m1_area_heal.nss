#include "M1_Plot"
void main()
{
    object oExit = GetExitingObject();
    if(GetIsPC(oExit) && PCsInArea() == FALSE)
    {
        HealEveryone();
    }
}
