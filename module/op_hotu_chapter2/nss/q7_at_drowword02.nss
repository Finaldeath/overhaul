// sets the Valsharess to call the PC by name

void main()
{
    string sName = GetName(GetPCSpeaker());
    SetCustomToken(5002, sName);
}
