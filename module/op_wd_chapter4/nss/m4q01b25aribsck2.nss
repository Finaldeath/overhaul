//// Check if PC is one who made Aribeth Surrender

int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(GetModule(), "M4Q01SURRENDER") == GetPCSpeaker();
    return iResult;
}
