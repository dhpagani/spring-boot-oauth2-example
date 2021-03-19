import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppDataModule } from './app.datamodule';
import { ProjectsEModule } from './entrypoint/projects/projects.entry.module';
import { TasksEModule } from './entrypoint/tasks/tasks.entry.module';

@Module({
    imports: [TasksEModule, ProjectsEModule, AppDataModule],
    controllers: [AppController],
})
export class AppModule {}
