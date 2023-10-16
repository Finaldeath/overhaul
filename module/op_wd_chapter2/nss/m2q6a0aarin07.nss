// this sets the global for the module that at least one of the players has spoken to
// Aarin Gend and gotten the low-down on the areas that need to be visited in Chapter 2.

void main()
{
    SetLocalInt(GetModule(),"Chapter2_Talked_To_Aarin",1);
}
