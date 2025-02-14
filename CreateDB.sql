USE [master]
GO
/****** Object:  Database [RequestsDB]    Script Date: 16.07.2019 15:59:08 ******/
CREATE DATABASE [RequestsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RequestsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLMSEXPRESS\MSSQL\DATA\RequestsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RequestsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLMSEXPRESS\MSSQL\DATA\RequestsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RequestsDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RequestsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RequestsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RequestsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RequestsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RequestsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RequestsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RequestsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RequestsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RequestsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RequestsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RequestsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RequestsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RequestsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RequestsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RequestsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RequestsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RequestsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RequestsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RequestsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RequestsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RequestsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RequestsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RequestsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RequestsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RequestsDB] SET  MULTI_USER 
GO
ALTER DATABASE [RequestsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RequestsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RequestsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RequestsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RequestsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RequestsDB] SET QUERY_STORE = OFF
GO
USE [RequestsDB]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 16.07.2019 15:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppName] [varchar](50) NOT NULL,
	[DescriptionApp] [text] NOT NULL,
	[Precedency] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 16.07.2019 15:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestName] [varchar](50) NOT NULL,
	[EndTime] [date] NOT NULL,
	[DescriptionRequest] [text] NULL,
	[Email] [varchar](50) NOT NULL,
	[ApplicationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (1, N'CRM Bank', N'Banking CRMs provide a 360-degree view of customer data, including accounts, service inquiries and marketing segmentation. A well-designed system will provide an instantaneous, at-a-glance view of a customer, allowing employees', 3)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (2, N'Gold Corona', N'There are multiple communication channels available to customers. Each point of contact provides an opportunity to address questions, complaints, or compliments. Ensuring all customer-facing personnel have access to the banking CRM allows them to quickly capture their customer interactions, record follow-ups and provide fast resolution.', 2)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (3, N'Mobile APK', N'Leveraging the power of a CRM database, banks can make highly-educated product recommendations to customers. For example, Hitachi Solutions for Banking includes powerful tools to help bankers understand the most relevant product to offer a customer based on their demographics, current product mix, and life circumstances. ', 1)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (4, N'PUBG Mobile', N'PUBG Mobile – всеми известная и любимая игра ПАБГ мобайл пришла на Андроид устройства официально. Движок Unreal Engine 4 приносит невероятную графику, а также производит звуковые эффекты, который прекрасно воссоздает версию PC. В игре вам все так же приходится выживать на отдаленном острове, воевать против других игроков и если повезет, то остаться в живых!', 2)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (5, N'Day R Premium', N'Day R Premium – захватывающая игра для IOS, где вы будете выживать в ядерном пост апокалиптическом мире. Эта игра перенесет вас в далекое прошлое в 1985 год, где на СССР напал невидимый враг и за считанные дни, уничтожил всю страну, запустив ядерное оружие.', 1)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (6, N'Instagram', N'Instagram — это простой способ рассказать о том, что происходит вокруг вас. Подписывайтесь на обновления друзей и родственников, чтобы знать, что у них происходит, и находите другие интересные аккаунты. Присоединяйтесь к сообществу, включающему более 1 млрд человек, и делитесь всеми моментами дня, от важных до самых повседневных', 4)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (7, N'AliExpress', N'Одежда, электроника, товары для дома и миллионы других классных штук у вас в кармане! Бесплатная доставка и скидки на большинство товаров.', 2)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (8, N'QIWI Кошелек', N'QIWI Кошелек упрощает платежи, переводы и оплату любой из 11 000 услуг со всего света. Установите кошелек и освободитесь для любимых дел.', 3)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (9, N'Clash of Clans', N'Присоединитесь к миллионам игроков по всему миру: стройте свою деревню, развивайте свой клан и соревнуйтесь в эпических войнах кланов!', 2)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (10, N'Яндекс.Навигатор', N'Навигатор прокладывает маршруты с учётом пробок, аварий и ремонтных работ. Он предлагает до трёх вариантов проезда и для каждого подсчитывает время в пути. Если маршрут проходит по платному участку, приложение предупредит и об этом.', 3)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (11, N'Soul Knight', N'«Это эпоха меча и револьвера. Магический камень, который поддерживал в нашем мире равновесие, украден высокотехнологичной расой пришельцев. Судьба мира висит на волоске. Сумеете ли вы вернуть артефакт? Все зависит от вас...»', 1)
INSERT [dbo].[Applications] ([Id], [AppName], [DescriptionApp], [Precedency]) VALUES (12, N'ВКармане: хранение документов офлайн', N'“ВКармане” – поможет удобно и безопасно хранить важные для вас и вашей семьи документы, банковские данные, заметки и пароли.', 1)
SET IDENTITY_INSERT [dbo].[Applications] OFF
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (1, N'Изменение стилей', CAST(N'2019-07-30' AS Date), N'Добавить то-то..., изменить то-то...', N'Karpov@mail.ru', 1)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (2, N'Добавление кнопки', CAST(N'2019-08-29' AS Date), N'Добавить кнопку редактирования и изменения', N'Grigorii@mail.ru', 3)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (3, N'Настройка отображения', CAST(N'2019-07-26' AS Date), N'Изменить параметры экрана', N'Kucherov@mail.ru', 2)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (4, N'Настройка отображения', CAST(N'2019-07-19' AS Date), N'Изменить параметры экрана', N'Karpov@mail.ru', 4)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (5, N'Изменение стилей', CAST(N'2019-08-10' AS Date), N'Добавить то-то..., изменить то-то...', N'Sergeev@yandex.ru', 10)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (6, N'Ошибка объекта', CAST(N'2019-07-31' AS Date), N'Добавить то-то..., изменить то-то...', N'Yerew@mail.ru', 11)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (7, N'Добавление кнопки', CAST(N'2019-09-14' AS Date), N'Добавить кнопку редактирования и изменения', N'Tk@mail.ru', 6)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (8, N'Поправить лэйбл', CAST(N'2019-10-16' AS Date), N'Буква имеет не тот шрифт', N'Kreggf@gmail.ru', 9)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (9, N'Изменить меню', CAST(N'2019-05-08' AS Date), N'Меню выровнять по левому краю', N'Ojfnn@mail.ru', 5)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (10, N'Настроить физику объекта', CAST(N'2019-12-25' AS Date), N'Объект двигается неправильно', N'Ufdgxh@yandex.ru', 10)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (11, N'Неверный коллайдер', CAST(N'2019-07-06' AS Date), N'Поменять коллайдер на объекте', N'iouokjm@mail.ru', 4)
INSERT [dbo].[Requests] ([Id], [RequestName], [EndTime], [DescriptionRequest], [Email], [ApplicationId]) VALUES (12, N'Изменение стилей', CAST(N'2019-07-27' AS Date), N'Добавить то-то..., изменить то-то...', N'Kucherov@mail.ru', 8)
SET IDENTITY_INSERT [dbo].[Requests] OFF
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([Id])
GO
USE [master]
GO
ALTER DATABASE [RequestsDB] SET  READ_WRITE 
GO
