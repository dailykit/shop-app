import Link from "next/link";

const Header = () => {
  return (
    <nav className="bg-white h-16 w-full flex flex-row items-center px-8 fixed">
      <div className="w-32">
        <img src="/img/logo.png" alt="DailyKIT Logo" />
      </div>
      <ul className="mx-16 list-none h-full flex flex-1">
        <Link href="/">
          <li className="mx-8 h-full flex items-center cursor-pointer font-semibold text-gray hover:text-blue">
            Home
          </li>
        </Link>
        <Link href="/menu">
          <li className="mx-8 h-full flex items-center cursor-pointer font-semibold text-gray hover:text-blue">
            Menu
          </li>
        </Link>
      </ul>
      <ul className="list-none h-full flex">
        <li className="mx-8 h-full flex items-center cursor-pointer font-semibold text-blue">
          Location
        </li>
        <li className="mx-8 h-full flex items-center cursor-pointer font-semibold text-gray hover:text-blue">
          Cart
        </li>
        <li className="mx-8 h-full flex items-center cursor-pointer font-semibold">
          <img
            src="/img/avatar.jpg"
            className="w-10 h-10 rounded-full"
            alt="Avatar"
          />
        </li>
      </ul>
    </nav>
  );
};

export default Header;
