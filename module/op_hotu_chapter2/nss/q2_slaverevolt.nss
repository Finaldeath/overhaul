//Slave revolt is in action

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X2_Revolt_Active")==1;

               return iResult;
}
